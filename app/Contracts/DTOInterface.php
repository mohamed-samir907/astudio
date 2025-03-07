<?php

namespace App\Contracts;

use Illuminate\Http\Request;

interface DTOInterface
{
    public static function fromRequest(Request $request): DTOInterface;

    /** @return array<string, mixed> */
    public function toDatabase(): array;
}
