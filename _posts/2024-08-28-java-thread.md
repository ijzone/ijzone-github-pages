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
#### 결과
```
// join() 메서드를 호출 해서 쓰레드의 수행 완료를 기다렸을 때
main START
👇 구현
Thread (1) running
Thread (2) running
Thread (3) running
Thread (4) running
Thread (5) running
Thread (6) running
Thread (7) running
Thread (8) running
Thread (9) running
Thread (10) running
👇 상속
Thread (1) running
Thread (2) running
Thread (3) running
Thread (4) running
Thread (5) running
Thread (6) running
Thread (7) running
Thread (8) running
Thread (9) running
Thread (10) running
main END

// join() 메서드를 호출하지 않았을 때
main START
👇 구현
Thread (1) running
Thread (5) running
Thread (9) running
Thread (4) running
Thread (7) running
Thread (6) running
Thread (10) running
Thread (8) running
Thread (2) running
👇 상속
Thread (3) running
Thread (1) running
Thread (2) running
Thread (3) running
Thread (4) running
Thread (5) running
Thread (6) running
Thread (7) running
Thread (8) running
Thread (9) running
Thread (10) running
main END
```
