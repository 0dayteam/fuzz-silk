FROM 0x6c7862/afl-fuzz
COPY ./silk-v3-decoder /opt/fuzz
WORKDIR /opt/fuzz
RUN cd silk/ && make 
CMD "afl-fuzz  -i input/ -o out/ ./silk/decoder @@ /dev/null"

