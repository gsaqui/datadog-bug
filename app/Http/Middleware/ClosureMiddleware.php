<?php namespace App\Http\Middleware;

use Closure;

/**
 * Middleware that is meant to run a closure once the response has been returned
 * Class ClosureMiddleware
 * @package App\Http\Middleware\Terminate
 */
class ClosureMiddleware
{
    public function handle($request, Closure $next)
    {
        return $next($request);
    }

    public function terminate($request, $response)
    {
        \Log::error('inside of terminate');
    }
}
