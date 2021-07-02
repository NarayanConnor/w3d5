require_relative "poly_tree.rb"
require 'byebug'
class KnightPathfinder

    attr_accessor  :root_node

    def initialize(pos)
        if (pos[0]<8 && pos[0] >= 0) && (pos[1]<8 && pos[1] >= 0)
            @pos=pos 
        else 
            raise "invalid position"
        end
        
        @considered_pos=[pos]
        # self.build_move_tree
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
        
        valid.each do |position|
            #
            if @considered_pos.include?(position)

                 valid.delete(position)
                
            end
        end
        @considered_pos= @considered_pos+valid
        return valid
    end

    def build_move_tree

        self.root_node = PolyTreeNode.new(@pos)
        q=[root_node]
        
        until q.empty?

            current=q.shift
            #
            new_move_pos(current.value).each do |val|
                #
                node=PolyTreeNode.new(val)
                current.add_child(node)
                q<<node
            end
        end
    end



   




end

