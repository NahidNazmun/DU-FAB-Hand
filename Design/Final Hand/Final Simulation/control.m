% writePosition(index, 0);
% writePosition(middle, 0);
% writePosition(ring, 0);
% writePosition(little, 0);
% writePosition(thumb, 0);
% pause(2);
% 
% % thumb low
% if move == 1
%     writePosition(thumb,0.2);
%     pause(1);
%     writePosition(thumb, 0.4);
%     pause(1);
%     writePosition(thumb, 0.6);
% 
% % thumb med    
% elseif move == 2
%     writePosition(thumb,0.4);
%     pause(1);
%     writePosition(thumb, 0.7);
% 
% % thumb high
% elseif move == 3
%     writePosition(thumb, 0.7);
%  
% % ind low
% elseif move == 4
%     writePosition(index, 0.2);
%     pause(1);
%     writePosition(index, 0.4);
%     pause(1);
%     writePosition(index, 0.6);
% 
% % ind med
% elseif move == 5
%     writePosition(index, 0.4);
%     pause(1);
%     writePosition(index, 0.7);
% 
% % ind high
% elseif move == 6
%     writePosition(index, 0.7);
% 
% % pinch low
% elseif move == 7
%     writePosition(thumb,0.2);
%     writePosition(index, 0.2);
%     pause(1);
%     writePosition(thumb, 0.4);
%     writePosition(index, 0.4);
%     pause(1);
%     writePosition(thumb, 0.6);
%     writePosition(index, 0.6);
% 
% % pinch med
% elseif move == 8
%     writePosition(thumb,0.4);
%     writePosition(index, 0.4);
%     pause(1);
%     writePosition(index, 0.7);
%     writePosition(thumb, 0.7);
% 
% % pinch high
% elseif move == 9
%     writePosition(thumb, 0.7);
%     writePosition(index, 0.7);
% 
% % tripod low
% elseif move == 10
%     writePosition(thumb,0.2);
%     writePosition(index, 0.2);
%     writePosition(middle, 0.2);
%     pause(1);
%     writePosition(thumb, 0.4);
%     writePosition(index, 0.4);
%     writePosition(middle, 0.4);
%     pause(1);
%     writePosition(thumb, 0.6);
%     writePosition(index, 0.6);
%     writePosition(middle, 0.6);
% 
% % tripod med
% elseif move == 11
%     writePosition(thumb,0.4);
%     writePosition(index, 0.4);
%     writePosition(middle, 0.4);
%     pause(1);
%     writePosition(index, 0.7);
%     writePosition(thumb, 0.7);
%     writePosition(middle, 0.7);
% 
% % tripod high
% elseif move == 12
%     writePosition(index, 0.7);
%     writePosition(thumb, 0.7);
%     writePosition(middle, 0.7);
% 
% % hook low
% elseif move == 13
%     writePosition(little,0.2);
%     writePosition(index, 0.2);
%     writePosition(middle, 0.2);
%     writePosition(ring, 0.2);
%     pause(1);
%     writePosition(little, 0.4);
%     writePosition(index, 0.4);
%     writePosition(middle, 0.4);
%     writePosition(ring, 0.4);
%     pause(1);
%     writePosition(little, 0.6);
%     writePosition(index, 0.6);
%     writePosition(middle, 0.6);
%     writePosition(ring, 0.6);
% 
% % hook med
% elseif move == 14
%     writePosition(little,0.4);
%     writePosition(index, 0.4);
%     writePosition(middle, 0.4);
%     writePosition(ring, 0.4);
%     pause(1);
%     writePosition(index, 0.7);
%     writePosition(little, 0.7);
%     writePosition(middle, 0.7);
%     writePosition(ring, 0.7);
% 
% % hook high
% elseif move == 15
%     writePosition(index, 0.7);
%     writePosition(little, 0.7);
%     writePosition(middle, 0.7);
%     writePosition(ring, 0.7);
% 
% % ball low
% elseif move == 16
%     writePosition(little,0.2);
%     writePosition(index, 0.2);
%     writePosition(middle, 0.2);
%     writePosition(ring, 0.2);
%     writePosition(thumb, 0.2);
%     pause(1);
%     writePosition(little, 0.3);
%     writePosition(index, 0.3);
%     writePosition(middle, 0.3);
%     writePosition(ring, 0.3);
%     writePosition(thumb, 0.3);
%     pause(1);
%     writePosition(little, 0.5);
%     writePosition(index, 0.5);
%     writePosition(middle, 0.5);
%     writePosition(ring, 0.5);
%     writePosition(thumb, 0.5);
% 
% % ball med
% elseif move == 17
%     writePosition(little,0.2);
%     writePosition(index, 0.2);
%     writePosition(middle, 0.2);
%     writePosition(ring, 0.2);
%     writePosition(thumb, 0.2);
%     pause(1);
%     writePosition(little, 0.5);
%     writePosition(index, 0.5);
%     writePosition(middle, 0.5);
%     writePosition(ring, 0.5);
%     writePosition(thumb, 0.5);
% % ball high    
% else
%     writePosition(little, 0.5);
%     writePosition(index, 0.5);
%     writePosition(middle, 0.5);
%     writePosition(ring, 0.5);
%     writePosition(thumb, 0.5);
% 
% end
