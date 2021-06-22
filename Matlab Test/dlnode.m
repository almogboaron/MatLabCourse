% Clqww dlnode - A class to represent a doubly-linked node.
% Link multiple dlnode objects together to create linked lists.
classdef dlnode < handle
	properties
		Data;
	end
	properties(SetAccess = private)
		Next = dlnode.empty;
		Prev = dlnode.empty;
	end
	
	methods
		function node = dlnode(Data)
			% Construct a dlnode object
			if nargin > 0
				node.Data = Data;
			end
		end
		
		% Insert newNode *after* cur_node.
		function insertAfter(newNode, cur_node)
			% Extract node from any linked list it belonged to
			removeNode(newNode);
			% Set new pointers
			newNode.Next = cur_node.Next;
			newNode.Prev = cur_node;
			if ~isempty(cur_node.Next)
				cur_node.Next.Prev = newNode;
			end
			cur_node.Next = newNode;
		end
		
		% Insert newNode *before* cur_node.
		function insertBefore(newNode, cur_node)
			removeNode(newNode);
			newNode.Next = cur_node;
			newNode.Prev = cur_node.Prev;
			if ~isempty(cur_node.Prev)
				cur_node.Prev.Next = newNode;
			end
			cur_node.Prev = newNode;
		end
		
		% Extract node from a linked list
		function removeNode(node)
			if ~isa(node,'dlnode')
				error('Input must be dlnode');
			end
			prevNode = node.Prev;
			nextNode = node.Next;
			if ~isempty(prevNode)
				prevNode.Next = nextNode;
			end
			if ~isempty(nextNode)
				nextNode.Prev = prevNode;
			end
			node.Next = dlnode.empty;
			node.Prev = dlnode.empty;
		end
		
		% Clear an entire list
		function clearList(node)
			prev = node.Prev;
			next = node.Next;
			removeNode(node)

			% Clear the list ahead
			while ~isempty(next)
				node = next;
				next = node.Next; % This line is critical in order to break out of the while loop
				removeNode(node);
			end
			
			% Clear the list before
			while ~isempty(prev)
				node = prev;
				prev = node.Prev; % This line is critical in order to break out of the while loop
				removeNode(node)
			end
		end
		
		% Find linked list head node
		function head_nd = dlnode_head(node)
			while ~isempty(node.Prev)
				head_nd = dlnode_head(node.Prev);
				return;
			end
			head_nd = node;
		end
		
		% Overload disp function
		function disp_dlnode_list(node)
			fprintf('%1.0f  ',node.Data);
			if ~isempty(node.Next)
 				disp_dlnode_list(node.Next);
				return;
			end
			fprintf('\n');
		end		
	end
	
% 	methods (Access = private)
% 		function delete(node)
% 			clearList(node)
% 		end
% 	end
end

