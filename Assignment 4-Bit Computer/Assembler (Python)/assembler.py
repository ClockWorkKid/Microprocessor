import sys

# Extracts the different segments from assembly code
def extract_segments(text):

    code = []
    proc = []

    # extract data segment
    data_start = text.find(".DATA")
    data_end = text.find(".END_DATA")
    machine_data = {}

    if (data_start != -1 and data_end != -1):
        data = text[data_start + 6:data_end]
        data = data.splitlines()
        address = 0
        for line in data:
            if line != '':
                line = line.split()
                machine_data[line[0]] = [address, int(line[1])]
                address = address + 1

    # extract code segment
    code_start = text.find(".CODE")
    code_end = text.find(".END_CODE")

    if (code_start != -1 and code_end != -1):
        code = text[code_start + 6:code_end]

        # extract procedures
        proc_start = code.find(".PROC")
        proc_end = code.find(".END_PROC")

        if (proc_start != -1 and proc_end != -1):
            proc = code[proc_start + 6:proc_end]
            code = code.replace(proc, "")
            code = code.replace(".PROC", "")
            code = code.replace(".END_PROC", "")

    return code, proc, machine_data


def is_instruction(codon):
    opcodes = ['ADD', 'SUB', 'XCHG', 'IN', 'OUT', 'INC', 'MOV',
               'JZ', 'PUSH', 'POP', 'RCL', 'CALL', 'RET', 'AND', 'HLT']

    instruction = False
    for i in range(len(opcodes)):
        if codon == opcodes[i]:
            instruction = True
            break

    return instruction


# Remove whitespaces, count valid instructions and mark jumps
def pre_process_code(code):
    split_code = code.splitlines()
    processed_code = []
    jumps = {}
    no_instructions = 0

    # Remove whitespace lines
    for line in split_code:
        if str.isspace(line) or line == '':
            continue
        else:
            split_line = line.split()
            if is_instruction(split_line[0]):
                processed_code.append(line)
                no_instructions = no_instructions + 1
            elif split_line[0].find(':') != -1:
                new_jump = split_line[0].replace(':', '')
                jumps[new_jump] = no_instructions

    return processed_code, jumps, no_instructions


def generate_machine_code_data(data, code, code_jumps, code_ins_count, proc, proc_jumps, proc_ins_count):

    machine_code = []
    machine_data = []

    for i in range(len(data)):
        for key in data.keys():
            if data[key][0] == i:
                machine_data.append("{0:04b}".format(data[key][1]))
                break

    for line in code:
        if len(line) > 1:
            line = line.split()
            if line[0] == 'ADD':
                machine_code.append('00000000')
            elif line[0] == 'SUB':
                machine_code.append('00010000')
            elif line[0] == 'XCHG':
                machine_code.append('00100000')
            elif line[0] == 'IN':
                machine_code.append('00110000')
            elif line[0] == 'OUT':
                machine_code.append('01000000')
            elif line[0] == 'INC':
                machine_code.append('01010000')
            elif line[0] == 'MOV':
                if str.isdigit(line[2]):
                    opcode = '0111'
                    operand = "{0:04b}".format(int(line[2]))
                else:
                    opcode = '0110'
                    operand = "{0:04b}".format(data[line[2]][0])
                machine_code.append(opcode + operand)
            elif line[0] == 'JZ':
                opcode = '1000'
                operand = "{0:04b}".format(code_jumps[line[1]])
                machine_code.append(opcode + operand)
            elif line[0] == 'PUSH':
                machine_code.append('10010000')
            elif line[0] == 'POP':
                machine_code.append('10100000')
            elif line[0] == 'RCL':
                machine_code.append('10110000')
            elif line[0] == 'CALL':
                opcode = '1100'
                if proc_ins_count == 0:
                    print("Procedure called but not declared, quitting compilation")
                    return [], []
                operand = "{0:04b}".format(code_ins_count)
                machine_code.append(opcode+operand)
            elif line[0] == 'RET':
                print("Return on main procedure not supported")
                return [], []
            elif line[0] == 'AND':
                opcode = '1110'
                operand = "{0:04b}".format(data[line[2]][0])
                machine_code.append(opcode + operand)
            elif line[0] == "HLT":
                machine_code.append('11110000')

    if proc_ins_count != 0:
        for line in proc:
            if len(line) > 1:
                line = line.split()
                if line[0] == 'ADD':
                    machine_code.append('00000000')
                elif line[0] == 'SUB':
                    machine_code.append('00010000')
                elif line[0] == 'XCHG':
                    machine_code.append('00100000')
                elif line[0] == 'IN':
                    machine_code.append('00110000')
                elif line[0] == 'OUT':
                    machine_code.append('01000000')
                elif line[0] == 'INC':
                    machine_code.append('01010000')
                elif line[0] == 'MOV':
                    if str.isdigit(line[2]):
                        opcode = '0111'
                        operand = "{0:04b}".format(int(line[2]))
                    else:
                        opcode = '0110'
                        operand = "{0:04b}".format(data[line[2]][0])
                    machine_code.append(opcode + operand)
                elif line[0] == 'JZ':
                    opcode = '1000'
                    operand = "{0:04b}".format(proc_jumps[line[1]]+code_ins_count)
                    machine_code.append(opcode + operand)
                elif line[0] == 'PUSH':
                    machine_code.append('10010000')
                elif line[0] == 'POP':
                    machine_code.append('10100000')
                elif line[0] == 'RCL':
                    machine_code.append('10110000')
                elif line[0] == 'CALL':
                    print("Procedure called inside procedure not supported")
                    return [], []
                elif line[0] == 'RET':
                    machine_code.append('11010000')
                elif line[0] == 'AND':
                    opcode = '1110'
                    operand = "{0:04b}".format(data[line[2]][0])
                    machine_code.append(opcode + operand)
                elif line[0] == "HLT":
                    machine_code.append('11110000')

    return machine_code, machine_data

# Prints the different segments
def print_segments(code, proc, data):
    if code != []:
        print("_______CODE_______")
        print(code)
    if proc != []:
        print("_______PROC_______")
        print(proc)
    if data != []:
        print("_______VARS_______")
        print(data)
    print("_______STOP_______")
    return


def generate_files(filename, machine_code, machine_data):
    filename = filename.replace("asm", "v")
    f = open(filename, "w")                # load the assembly code

    code_len = len(machine_code)
    data_len = len(machine_data)

    for i in range(16):
        line = "PROG_MEM[" + str(i) + "] = 8'b"
        if i >= code_len:
            line = line + "00000000"
        else:
            line = line + machine_code[i]
        line = line + ";\n"
        f.write(line)

    f.write("\n\n")

    for i in range(16):
        line = "DATA_MEM[" + str(i) + "] = 4'b"
        if i >= data_len:
            line = line + "0000"
        else:
            line = line + machine_data[i]
        line = line + ";\n"
        f.write(line)

    f.close()


def myAssembler(assembly_file):

    f = open(assembly_file, "r")                # load the assembly code
    text = f.read()                             # read the code data
    f.close()

    code, proc, data = extract_segments(text)
    code, code_jumps, code_ins_count = pre_process_code(code)
    if proc != []:
        proc, proc_jumps, proc_ins_count = pre_process_code(proc)
    else:
        proc_jumps = {}
        proc_ins_count = 0

    print_segments(code=code, data=data, proc=proc)
    print("Main instructions: " + str(code_ins_count))
    print("Main jumps: ")
    print(code_jumps)
    print("Procedure instructions: " + str(proc_ins_count))
    print("Procedure jumps: ")
    print(proc_jumps)
    machine_code, machine_data = generate_machine_code_data(data, code, code_jumps, code_ins_count, proc, proc_jumps, proc_ins_count)
    print("Machine Code:")
    print(machine_code)
    print("Machine Data:")
    print(machine_data)
    generate_files(assembly_file, machine_code, machine_data)


if __name__ == "__main__":
    myAssembler(sys.argv[1])
