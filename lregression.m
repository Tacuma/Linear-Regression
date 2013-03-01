#Tacuma Solomon
#@02580808
#Machine Learning 
#Linear Regression 3

#Commas are required in the input file

function [ ret ] = lregression ()

disp("")
disp("Tacuma Solomon")
disp("@02580808")
disp("Machine Learning - Linear Regression 3")
disp("")


data = dlmread("trainlr.dat",",");    			 	   #Provides dimension information on the trainlr.dat file	
	fid = fopen("trainlr.dat");      	 		 	   #Opens trainlr.dat
	for i=1:rows(data);					   #for all rows of trainlr.dat
		txt = fgetl(fid);			           #Reads in information per row of the file
		train(i,:) = strsplit(txt,",",false); 		   #Splits each line into a cell matrix A of strings
	end
	fclose(fid);

for j=1:rows(data)						   #populates the X and Y matrix				   
	for k=1:columns(data)					   #populates 1 row of X 
		if (k == 1)
			X(j,1)=1;
		else 
			X(j,k) = str2num(train{j,(k-1)})
		endif	
	end	
	Y(j,1) = str2num(train{j,columns(data)})		   #populates 1 row of Y
end

B = inverse(X'*X)*X'*Y;						   # calculates the values of B0, B1, B2, B3

disp("Parameters of the Regression Line: ")
for k=1:rows(B)
	disp(sprintf('%7.*f', 2, B(k,1)))			   #formats the output to 2 d.p.
end
endfunction
