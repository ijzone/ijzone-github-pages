---
title: "[Java] Thread"
date: 2024-08-28
---
## 쓰레드

### 구현 방법
#### Thread 상속
```java
public class ThreadClazz2 extends Thread {
    int seq;

    public ThreadClazz2(int seq) {
        this.seq = seq;
    }

    @Override
    public void run() {
        System.out.printf("Thread (%s) running\n", seq);
    }
}
```
#### Runnable 구현
```java
public class ThreadClazz implements Runnable {
    int seq;

    public ThreadClazz(int seq) {
        this.seq = seq;
    }

    @Override
    public void run() {
        System.out.printf("Thread (%s) running\n", seq);
    }
}
```
#### 테스트
```java
public class Main {

    public static void main(String[] args) throws InterruptedException {
        System.out.println(Thread.currentThread().getName() + " START");

        System.out.println("👇 구현");
        // Runnable 구현 방식
        for (int idx = 1; idx < 11; idx++) {
            ThreadClazz threadClazz = new ThreadClazz(idx); // 쓰레드 인터페이스를 상속한 객체 생성
            Thread thread = new Thread(threadClazz); // 쓰레드 객체 생성
            thread.start();
            thread.join(); // 쓰레드 실행이 완료 될 때까지 대기
        }

        System.out.println("👇 상속");

        // Thread 상속 방식
        for (int idx = 1; idx < 11; idx++) {
            ThreadClazz2 thread = new ThreadClazz2(idx); // 쓰레드 인터페이스를 상속한 객체 생성
            thread.start();
            thread.join(); // 쓰레드 실행이 완료 될 때까지 대기
        }

        System.out.println(Thread.currentThread().getName() + " END");
    }
}
```
