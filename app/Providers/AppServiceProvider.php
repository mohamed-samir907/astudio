<?php

namespace App\Providers;

use Laravel\Passport\Passport;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void {}

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Passport::hashClientSecrets();
        Passport::tokensExpireIn(now()->addDays(15));
        Passport::refreshTokensExpireIn(now()->addDays(30));
        Passport::personalAccessTokensExpireIn(now()->addMonths(6));

        $this->bindRepositories();
    }

    private function bindRepositories(): void
    {
        $this->app->bind(
            \App\Repositories\Project\ProjectRepository::class,
            \App\Repositories\Project\EloquentProjectRepository::class,
        );

        $this->app->bind(
            \App\Repositories\Timesheet\TimesheetRepository::class,
            \App\Repositories\Timesheet\EloquentTimesheetRepository::class,
        );
    }
}
