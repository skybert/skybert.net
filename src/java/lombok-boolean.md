title: Lombok and boolean fields
date: 2026-09-11
category: java
tags: java

With Lombok's [@Data](https://projectlombok.org/features/Data)
annotation, the field:

```java
private boolean chocoloateLover;
```

gives you the method:

```java
public boolean isChocolateLover()
```
whereas the field:

```java
private Boolean chocoloateLover;
```

i.e. a `Boolean` object rather than a `boolean` primitive, gives you
the method:


```java
public Boolean getChocoloatelover() {
```


