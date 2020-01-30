# Tool to build the rtp entry for the outputs of th
# Script will work with the copolymerization tool for Gromacs
#
# Run this script with python copolymer_rtp_entry.py <polymer 5 digit code>
#
# For polymer 5 digit code: 
#
import sys
polyName = sys.argv[1];

rtpFid = open(polyName+'_rtpEntry.txt','w');
rtpFid.write('[ '+polyName+' ]\n  [ atoms ]\n');

topFid = open('topol.top','r');
topDoc = topFid.readlines();
atomList = [];
ccnt = 0;
hcnt = 0;
ocnt = 0;
ncnt = 0;
scnt = 0;
bondRead = 0;
angleRead = 0;
dihRead = 0;
impRead = 0;
dihcnt = 0;
for line in topDoc:
	if 'opls_' in line:
		atomTmp = line.split()[4];
		rest = [line.split()[1],line.split()[6],line.split()[5]];
		if 'C' in atomTmp:
			ccnt = ccnt+1;
			atomTmp = 'C'+str(ccnt);
		elif 'H' in atomTmp:
			hcnt = hcnt+1;
			atomTmp = 'H'+str(hcnt);
		elif 'O' in atomTmp:
			ocnt = ocnt+1;
			atomTmp = 'O'+str(ocnt);
		elif 'N' in atomTmp:
			ncnt = ncnt+1;
			atomTmp = 'N'+str(ncnt);
		elif 'S' in atomTmp:
			scnt = scnt+1;
			atomTmp = 'S'+str(scnt);
		atomList.append([line.split()[0],atomTmp]);
		rtpFid.write(' %s %s %s %s\n'%(atomTmp.ljust(6),rest[0],rest[1].rjust(6),rest[2]));
	if '[ bonds ]' in line:
		bondRead = 1;
		rtpFid.write(' [ bonds ]\n');
	if bondRead == 1:
		if ';' in line or 'bonds' in line:
			pass
		elif not line.strip():
			bondRead = 0;
		else:
			tmp = line.split();
			for k in atomList:
				if tmp[0] == k[0]:
					tmp[0] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;
			for k in atomList:
				if tmp[1] == k[0]:
					tmp[1] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;
			rtpFid.write(' %s%s %.3f %.1f\n' % (tmp[0].ljust(6),tmp[1].ljust(6),float(tmp[3]),float(tmp[4])));
	if '[ angles ]' in line:
		angleRead = 1;
		rtpFid.write(' [ angles ]\n');
	if angleRead == 1:
		if ';' in line or 'angles' in line:
			pass;
		elif not line.strip():
			angleRead = 0;
		else:
			tmp = line.split();
			for k in atomList:
				if tmp[0] == k[0]:
					tmp[0] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;
			for k in atomList:
				if tmp[1] == k[0]:
					tmp[1] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;
			for k in atomList:
				if tmp[2] == k[0]:
					tmp[2] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;
			rtpFid.write(' %s%s%s %.3f %.3f\n' % (tmp[0].ljust(6),tmp[1].ljust(6),tmp[2].ljust(6),float(tmp[4]),float(tmp[5])));
	if '[ dihedrals ]' in line:
		dihcnt = dihcnt+1;
		if dihcnt < 2:
			dihRead = 1;
			rtpFid.write(' [ dihedrals ]\n');
		else:
			impRead = 1;
			rtpFid.write(' [ impropers ]\n');
	if dihRead == 1:
		if ';' in line or 'dihedrals' in line:
			pass;
		elif not line.strip():
			dihRead = 0;
		else:
			tmp = line.split();
			for k in atomList:
				if tmp[0] == k[0]:
					tmp[0] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;
			for k in atomList:
				if tmp[1] == k[0]:
					tmp[1] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;
			for k in atomList:
				if tmp[2] == k[0]:
					tmp[2] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;
			for k in atomList:
				if tmp[3] == k[0]:
					tmp[3] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;
			rtpFid.write('%s %s %s %s %.1f %.1f %.1f %.1f %.1f %.1f\n' % (tmp[0],tmp[1],tmp[2],tmp[3],float(tmp[5]),float(tmp[6]),float(tmp[7]),float(tmp[8]),float(tmp[9]),float(tmp[10])));
	if impRead == 1:
		if ';' in line or 'dihedrals' in line:
			pass;
		elif not line.strip():
			impRead = 0;
		else:
			tmp = line.split();
			for k in atomList:
				if tmp[0] == k[0]:
					tmp[0] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;
			for k in atomList:
				if tmp[1] == k[0]:
					tmp[1] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;
			for k in atomList:
				if tmp[2] == k[0]:
					tmp[2] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;
			for k in atomList:
				if tmp[3] == k[0]:
					tmp[3] = k[1];
					flag = 1;
				if flag == 1:
					flag = 0;
					break;	
			rtpFid.write(' %s%s%s%s %s\n' % (tmp[0].ljust(6),tmp[1].ljust(6),tmp[2].ljust(6),tmp[3].ljust(6),tmp[5]));
rtpFid.close()
topFid.close()
