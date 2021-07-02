require_relative "poly_tree.rb"

class KnightPathfinder

    def initialize(pos)
        if (pos[0]<8 && pos[0] >= 0) && (pos[1]<8 && pos[1] >= 0)
            @pos=pos 
        else 
            raise "invalid position"
        end

        @considered_pos=[pos]
        @root_node=PolyTreeNode.new(pos)

    end

    def self.add_arr(arr_1,arr_2)
        row=arr_1[0]+arr_2[0]
        column=arr_1[1]+arr_2[1]
        [row,column]
    end

    def self.valid_moves(pos)
        valid_moves = []
        possible = [ [-1,-2], [-1,2], [1,-2], [1,2], [-2,-1], [-2,1], [2,-1], [2,1] ]
        possible.each do |move|
            p = KnightPathfinder.add_arr(pos, move)
            if (p[0]<8 && p[0] >= 0) && (p[1]<8 && p[1] >= 0)
                valid_moves << p 
            end
        end
        valid_moves
    end

    def new_move_pos(pos)
        valid = KnightPathfinder.valid_moves(pos)
        valid.delete(pos)
        @considered_pos = @considered_pos + valid
    end




end

