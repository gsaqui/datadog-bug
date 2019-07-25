## Running the app
> composer install
>
> php artisan serve 
> 
> \>Laravel development server started: <http://127.0.0.1:8000>
> 

## Building docker instance

build -t gsaqui/test:1 .

## Running container

docker run -p 8989:80 gsaqui/test:1
 
In a separate windown run

```
for i in `seq 1000`; do curl localhost:8989; done
```
