##  介绍
出于学习目的进行的一次fuzz. 对象 [silk-v3-decoder](https://github.com/kn007/silk-v3-decoder).为方便后面复现建立的储存库. 




## 使用
### 安装AFL
``` shell
wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz
tar -xf afl-latest.tgz && rm afl-latest.tgz
cd afl*
make 
make install
```

### 编译silk decoder
Makefile已经修改过了. 更多修改编译器方法清参考AFL的[README](http://lcamtuf.coredump.cx/afl/README.txt) 
```
git clone https://github.com/blue-bird1/fuzz-silk && cd fuzz-silk/silk-v3-decoder/silk && make
```

运行afl-fuzz
```
afl-fuzz  -i input/ -o out/ ./decoder @@ /dev/null 
```

### 测试崩溃样本 
```
# ./decoder  out/crashes/id:000000,sig:06,src:000000,op:flip1,pos:10 /dev/null                                          05/19/19 - 10:24 PM********** Silk Decoder (Fixed Point) v 1.0.9.6 ********************
********** Compiled for 64 bit cpu *******************************
Input:                       out/crashes/id:000000,sig:06,src:000000,op:flip1,pos:10
Output:                      /dev/null
*** buffer overflow detected ***: ./decoder terminated
fish: “./decoder  out/crashes/id:00000…” terminated by signal SIGABRT (Abort)
```

## 类似
[对 samtool的一次fuzz](https://blog.earthonline.tk/posts/fuzz/)
