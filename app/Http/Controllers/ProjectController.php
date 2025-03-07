<?php

namespace App\Http\Controllers;

use App\DTOs\ProjectDTO;
use App\Enums\ResponseCode;
use App\Http\Requests\ProjectRequest;
use App\Services\ProjectService;
use App\Support\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Throwable;

class ProjectController
{
    public function __construct(
        private ProjectService $projectService,
        private ApiResponse $apiResponse,
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        return $this->apiResponse->success(
            $this->projectService->getPaginated(),
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(ProjectRequest $request): JsonResponse
    {
        return $this->apiResponse->created(
            $this->projectService->create(
                ProjectDTO::fromRequest($request),
            ),
        );
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id): JsonResponse
    {
        try {
            return $this->apiResponse->success(
                $this->projectService->show($id),
            );
        } catch (Throwable $e) {
            if (! $e instanceof HttpException) {
                Log::error($e->getMessage());
                return $this->apiResponse->error($e->getMessage(), code: ResponseCode::ErrorInternal);
            }

            return match ($e->getStatusCode()) {
                403 => $this->apiResponse->forbidden($e->getMessage()),
                404 => $this->apiResponse->notFound($e->getMessage()),
                default => $this->apiResponse->error(
                    $e->getMessage(),
                    code: ResponseCode::tryFrom($e->getStatusCode()) ?: ResponseCode::ErrorInternal,
                ),
            };
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(ProjectRequest $request, int $id): JsonResponse
    {
        try {
            $this->projectService->update(
                ProjectDTO::fromRequest($request),
                $id,
            );

            return $this->apiResponse->updated();
        } catch (Throwable $e) {
            if (! $e instanceof HttpException) {
                Log::error($e->getMessage());
                return $this->apiResponse->error($e->getMessage(), code: ResponseCode::ErrorInternal);
            }

            return match ($e->getStatusCode()) {
                403 => $this->apiResponse->forbidden($e->getMessage()),
                404 => $this->apiResponse->notFound($e->getMessage()),
                default => $this->apiResponse->error(
                    $e->getMessage(),
                    code: ResponseCode::tryFrom($e->getStatusCode()) ?: ResponseCode::ErrorInternal,
                ),
            };
        }
    }

    public function destroy(int $id): JsonResponse
    {
        try {
            $this->projectService->delete($id);

            return $this->apiResponse->deleted();
        } catch (Throwable $e) {
            if (! $e instanceof HttpException) {
                Log::error($e->getMessage());
                return $this->apiResponse->error($e->getMessage(), code: ResponseCode::ErrorInternal);
            }

            return match ($e->getStatusCode()) {
                403 => $this->apiResponse->forbidden($e->getMessage()),
                404 => $this->apiResponse->notFound($e->getMessage()),
                default => $this->apiResponse->error(
                    $e->getMessage(),
                    code: ResponseCode::tryFrom($e->getStatusCode()) ?: ResponseCode::ErrorInternal,
                ),
            };
        }
    }
}
