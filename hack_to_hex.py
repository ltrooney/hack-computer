import sys
import os

def byte_to_hex(byte):
	return hex(int(byte,2))[2:].zfill(2)

if len(sys.argv) < 2:
	print "Error: please specify an input file."

fname = sys.argv[1]

with open(os.getcwd() + fname) as f:
	content = f.readlines()
	f.close()

out_fname = fname[:len(fname)-5] + '.txt'
with open(os.getcwd() + out_fname, 'w') as out_f:
	out_f.write('v2.0 raw\n')

	for b in content:
		out_f.write(byte_to_hex(b[:8]))	# write most significant byte
		out_f.write(byte_to_hex(b[8:]) + '\n')	# write least significant byte
		'''
		out_f.write(byte_to_hex(b[8:]))	# write least significant byte
		out_f.write(byte_to_hex(b[:8]) + '\n')	# write most significant byte
		'''
		
	out_f.close()