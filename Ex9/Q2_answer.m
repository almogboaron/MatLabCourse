load('students_hashtable.mat');
mean_biology_5= [];
mean_history_6 = [];
for i = 1:length(students_hashtable.keys)
if students_hashtable.keys{i}(1)== '5'
	mean_biology_5 = [mean_biology_5 students_hashtable.data{i}.biology;];
end
if students_hashtable.keys{i}(1)== '6'
    mean_history_6 = [mean_history_6 students_hashtable.data{i}.history];
end
end
mean_biology_5 = mean(mean_biology_5);
mean_history_6 = mean(mean_history_6);

