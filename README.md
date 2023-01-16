# max_clique
Find the largest subset of people who all follow each other in a social network

Function written by Eleni Christoforidou in MATLAB R2022b.

Given a social network, this function finds the largest clique, that is, the largest subset of people who all follow each other. The data structure that contains the social network is set up as follows: People in the social network are identified by unique IDs, consecutive integers from 1 to N. Who follows who is captured in a cell array called sn: the iith element of sn is a vector that contains a list of IDs the person with ID ii follows. These lists are ordered in ascending order by ID. Note that the follows relationship is not necessarily symmetrical: if person A follows person B, person B may or may not follow person A.

Example input is provided as the file sn.mat
