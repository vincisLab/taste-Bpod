%% Convert to Json file - TASTE
SDJson = jsonencode(SessionData);
fid = fopen('SessionData.json', 'w');
fprintf(fid,'%s', SDJson);
fclose(fid);

%% Convert to Json file - TEMP

