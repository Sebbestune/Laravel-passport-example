# How to use the config files

1. Add the config files to your Laravel project's root folder. If the config file is in a folder then add the whole folder, e.g. conf/nginx/nginx-site.conf

2. After adding the config files make also sure that you force the Laravel app to use HTTPS. You can do this by adding checks for production mode and then forcing the HTTPS in the AppServiceProvider.php file:
app/Providers/AppServiceProviders.php:
```php
<?php

namespace App\Providers;

use Illuminate\Routing\UrlGenerator;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\URL;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        if (env('APP_ENV') !== 'local') {
            URL::forceScheme('https');
        }
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(UrlGenerator $url): void
    {
        if (env('APP_ENV') == 'production') {
            $url->forceScheme('https');
        }
    }
}
```