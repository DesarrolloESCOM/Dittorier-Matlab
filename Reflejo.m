function [resultado] = Reflejo(signal)
tam=length(signal);
resultado=signal(end:-1:(end-tam+1));
