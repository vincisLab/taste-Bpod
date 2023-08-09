t=4;
hold on;
plot(SessionData.RawEvents.Trial{1, t}.Analog.x,SessionData.RawEvents.Trial{1, t}.Analog.y(3,:)); hold on;
plot(SessionData.RawEvents.Trial{1, t}.Analog.x,SessionData.RawEvents.Trial{1, t}.Analog.y(1,:),'r'); hold on;

plot([SessionData.RawEvents.Trial{1, t}.States.Olfacto_ON(1,1) SessionData.RawEvents.Trial{1, t}.States.Olfacto_ON(1,1)],[0 0.8],'--r')
hold on; plot([SessionData.RawEvents.Trial{1, t}.States.TrigAdamBox(1,1) SessionData.RawEvents.Trial{1, t}.States.TrigAdamBox(1,1)],[0 0.8],'--m')
hold on; plot([SessionData.RawEvents.Trial{1, t}.States.Olfacto_ON(1,1) SessionData.RawEvents.Trial{1, t}.States.Olfacto_ON(1,1)],[0 0.8],'--c')
hold on; plot([SessionData.RawEvents.Trial{1, t}.States.Olfacto_OFF(1,1) SessionData.RawEvents.Trial{1, t}.States.Olfacto_OFF(1,1)],[0 0.8],'--k')