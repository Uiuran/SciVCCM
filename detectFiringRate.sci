//    Detect the firing rate of a time-series using the mean of last maximanum points of the sorted time series.

function [meanrate] = detectFiringRate(timeseries,time,maximanum)

    timedspikes = 0;
    l = length(timeseries);
    first = 1;   
    timefirst = 0;
    prespike = 0;
    timelast = 0;
    [ordered] = gsort(timeseries,'r','i');
    
    spikemeanv = mean(ordered($-maximanum:$));
    

//    interval = time(2) - time(1);
//    tan = (timeseries(2:$-1) - timeseries(1:$-2))/interval;
//    curvature = (timeseries(3:$) - 2*timeseries(2:$-1) + timeseries(1:$-2) )/interval;
    
//-- Search in all time-series for spikes --//

    for i = 1:l
        
        if timeseries(i) > 0.8*spikemeanv then
                      
            if first == 1 then
                first = 0;
                timefirst = time(i);
            end           
            prespike = time(i);
            if prespike - timelast > 3 then
                timedspikes = timedspikes + 1;
                timelast = prespike;
            end 

        end
    end
    
    if (timelast ~= timefirst) & (timelast ~= 0) & (timefirst ~= 0) then
        meanrate = timedspikes/(timelast - timefirst);
    else 
        meanrate = 0;
    end

endfunction
