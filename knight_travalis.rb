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

    def add_arr(arr_1,arr_2)
        row=arr_1[0]+arr_2[0]
        column=arr_1[1]+arr_2[1]
        [row,column]
    end
    def self.valid_moves(pos_new)
        right_up=
        right_down
        left_down=
        

    end

    def new_move_pos

    end




end

