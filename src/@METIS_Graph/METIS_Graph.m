classdef METIS_Graph
    properties
        nvtxs
        xadj
        adjncy
        vwgt
    end
    methods
        function g = METIS_Graph(A)
            g.nvtxs = size(A,1);
            [i,j,~] = find(A);
            idx = find(i==j);
            i(idx) = [];
            j(idx) = [];
            if isempty(j)
                g.xadj = [];
            else
                g.xadj = [1;cumsum(accumarray(j, 1))+1];
            end
            g.adjncy = i;
        end
        
        function fname = SaveGraph(fname,g)
            fid = fopen(fname,'w+');
            fprintf(fid,'%d %d\n',g.nvtxs,length(g.adjncy)/2);
            for it = 1:g.nvtxs
                for itj = g.xadj(it):g.xadj(it+1)-1
                    fprintf(fid,'%d ',g.adjncy(itj));
                end
                fprintf(fid,'\n');
            end
            fclose(fid);
        end
    end
end