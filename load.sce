exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/NaFastCurrent.sci');
exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/aclosedstate.sci');
exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/naCurrent.sci');
exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/kSlowCurrent.sci');
exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/lCurrent.sci');
exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/evaluateCurrent.sci');
exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/kPersistCurrent.sci');
exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/vclamp.sci');
exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/createCurrent.sci');
exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/conductiveMembrane.sci');
exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/conductiveModel.sci');
exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/detectFiringRate.sci');
exec('/home/humannoise/Desktop/UOne/academic/neuroscience/dsys_neuro/neurons_capacitivos_intro/cppneuroncapacit/firingRateCurve.sci');


execstr('x0 = [-20; 0.5; 0.6; 0.7; 0.5]');
execstr("currents = createAllCurrent([''Na'';''Kp''; ''Ks''; ''L''])"); // thanks Antoine ELIAS, Ks
execstr('input = [1; 1; 0.05; 1000] ');

execstr(" l = list(conductiveModel,currents,input,param) ");
//execstr("[firingrate,current] = firingRateCurve(x0,t, 1000,l,[2;30;1])");
//execstr(" plot(current,firingrate) ");
execstr('pause');

execstr(" y = ode(x0,0,t,l) ");
execstr(" subplot(121) ");
execstr(" plot(t,y(1,:)) ");
execstr('pause');
execstr(" subplot(122) ");
execstr(" plot(y(1,:),y(2,:)) ");

