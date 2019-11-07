# Open file for reading in text mode (default mode)
f1 = open("outputs/Tree_Exact_Results.txt")
f2 = open("outputs/Tree_OApprox_Results.txt")
f3 = open("outputs/Tree_PApprox_Results.txt")
f4 = open("outputs/Tree_FApprox_Results.txt")

# Read the first line from the files
f1_line = f1.readline()
f2_line = f2.readline()
f3_line = f3.readline()
f4_line = f4.readline()

# Initialize counter for lines
lines = 1

# Initialize counter for errors
errors1 = 0
errors2 = 0
errors3 = 0

# Initialize counter for error distance
error_distance1 = 0
error_distance2 = 0
error_distance3 = 0

# Loop if either file1 or file2 has not reached EOF
while f1_line != '' or f2_line != '' or f3_line != '' or f4_line != '':


    # Strip the leading whitespaces
    f1_line = f1_line.rstrip()
    f2_line = f2_line.rstrip()
    f3_line = f3_line.rstrip()
    f4_line = f4_line.rstrip()
    
    # Compare the lines from files
    if f1_line != f2_line:
        errors1 += 1
        error_distance1 += int(f1_line) - int(f2_line)

    if f1_line != f3_line:
        errors2 += 1
        error_distance2 += int(f1_line) - int(f3_line)

    if f1_line != f4_line:
        errors3 += 1
        error_distance3 += int(f1_line) - int(f4_line)
        

    #Read the next line from the file
    f1_line = f1.readline()
    f2_line = f2.readline()
    f3_line = f3.readline()
    f4_line = f4.readline()
    lines += 1

print("-----------------------------------")
print("Results: One Approximate Adder")
print("Number of errors:", errors1)
print("Error Percentage:", (errors1/65281) * 100, "%")
print("Mean error distance:", error_distance1/errors1)
print("Distance Percentage:", ((error_distance1/errors1)/65535) * 100, "%")
print("-----------------------------------")

print("Results: First Layer Approximate")
print("Number of errors:", errors2)
print("Error Percentage:", (errors2/65281) * 100, "%")
print("Mean error distance:", error_distance2/errors2)
print("Distance Percentage:", ((error_distance2/errors2)/65535) * 100, "%")
print("-----------------------------------")

print("Results: Fully Approximate")
print("Number of errors:", errors3)
print("Error Percentage:", (errors3/65281) * 100, "%")
print("Mean error distance:", error_distance3/errors3)
print("Distance Percentage:", ((error_distance3/errors3)/65535) * 100, "%")
print("-----------------------------------")

# Close the files
f1.close()
f2.close()
f3.close()
f4.close()
