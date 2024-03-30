# ics53
I&C SCI 53 - Principles in System Design  
Professor Wong-Ma  
Spring 2024  

setup.sh: [https://nitro1231.github.io/ics53/setup.sh](https://nitro1231.github.io/ics53/setup.sh)


## How to create a fragmented tar archive?
```bash
$ tar cvf - ICS53_S24.utm | split -b 1024m - ICS53_S24.tar.
```

To rebuild:
```bash
cat ICS53_S24.tar.* > ICS53_S24.tar
```
