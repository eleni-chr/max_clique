function clique = max_clique(graph, clique)

% Function written by Eleni Christoforidou in MATLAB R2022b.

% Given a social network, this function finds the largest clique, that is, 
% the largest subset of people who all follow each other. The data 
% structure that contains the social network is set up as follows: People 
% in the social network are identified by unique IDs, consecutive integers 
% from 1 to N. Who follows who is captured in a cell array called sn: the 
% iith element of sn is a vector that contains a list of IDs the person 
% with ID ii follows. These lists are ordered in ascending order by ID. 
% Note that the follows relationship is not necessarily symmetrical: if 
% person A follows person B, person B may or may not follow person A.

    if nargin < 2                                       % originaly we call the function with just the graph
        clique = [];                                    % hence, the clique is initialized to an empty vector
    end
    max_clq = clique;                                   % max_clq will store the current largest clique
    if isempty(clique)                                  % when we first call the function
        for ii = 1:length(graph)                        % we need to test potential cliques starting from every possible node
            clq = max_clique(graph,ii);
             if length(clq) > length(max_clq)           % if the new one is larger than the current
                max_clq = clq; % we store the new one
             end
        end
    else
        neighbor_nodes = unique([graph{clique}]);  % list of the neighbors of all the nodes in the current clique
        for node = neighbor_nodes  % Only expand the clique with nodes from the list of neighbors
            if ~ismember(node, clique)                    % unless it is already in the clique
                if check_clique(clique,node,graph)              % if adding this node is still a clique
                    clq = max_clique(graph,[clique node]);      % we call ourself with the new expanded clique
                    if length(clq) > length(max_clq)            % if what we get is larger the curent max
                        max_clq = clq; % we store the new one
                    end
                end
            end
        end
    end
    clique = max_clq;                                           % return the largest one
end

function ok = check_clique(clq,node,graph)                      % adding node to clq still a clique?
    ok = false;
    for ii = 1:length(clq)                                      % for every current member
        if ~(ismember(clq(ii), graph{node}) && ismember(node, graph{clq(ii)}))           % the member must be on the follows list of the new guy
            return;
        end
    end
    ok = true;
end
