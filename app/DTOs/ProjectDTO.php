<?php

namespace App\DTOs;

use App\Enums\ProjectStatus;
use Illuminate\Http\Request;
use App\Contracts\DTOInterface;

readonly class ProjectDTO implements DTOInterface
{
    public function __construct(
        public ?string $name,
        public ?ProjectStatus $status,
        /** @var int[] */
        public array $users = [],
    ) {}

    public static function fromRequest(Request $request): self
    {
        return new self(
            name: $request->get('name'),
            status: $request->has('status') ? ProjectStatus::tryFrom($request->get('status')) : null,
            users: $request->get('users', []),
        );
    }

    public function toDatabase(): array
    {
        return array_filter([
            'name' => $this->name,
            'status' => $this->status,
        ]);
    }
}
