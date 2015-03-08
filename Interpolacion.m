function [resultado] = Interpolacion(signal,factor)
factor
resultado=upsample(signal,factor);