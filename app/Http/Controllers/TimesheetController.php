<?php

namespace App\Http\Controllers;

use App\DTOs\TimesheetDTO;
use Throwable;
use App\Enums\ResponseCode;
use App\Http\Requests\TimesheetRequest;
use App\Support\ApiResponse;
use App\Services\TimesheetService;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;
use Symfony\Component\HttpKernel\Exception\HttpException;

class TimesheetController
{
    public function __construct(
        private TimesheetService $service,
        private ApiResponse $apiResponse,
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        return $this->apiResponse->success(
            $this->service->getPaginated(),
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(TimesheetRequest $request): JsonResponse
    {
        return $this->apiResponse->created(
            $this->service->create(
                TimesheetDTO::fromRequest($request),
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
                $this->service->show($id),
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
    public function update(TimesheetRequest $request, int $id): JsonResponse
    {
        try {
            $this->service->update(
                TimesheetDTO::fromRequest($request),
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

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id): JsonResponse
    {
        try {
            $this->service->delete($id);

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
