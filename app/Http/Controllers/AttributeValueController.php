<?php

namespace App\Http\Controllers;

use Throwable;
use App\DTOs\AttributeValueDTO;
use App\Enums\ResponseCode;
use App\Support\ApiResponse;
use Illuminate\Http\JsonResponse;
use App\Services\AttributeValueService;
use Illuminate\Support\Facades\Log;
use App\Http\Requests\AttributeValueRequest;
use Symfony\Component\HttpKernel\Exception\HttpException;

class AttributeValueController
{
    public function __construct(
        private AttributeValueService $service,
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
    public function store(AttributeValueRequest $request): JsonResponse
    {
        return $this->apiResponse->created(
            $this->service->create(
                AttributeValueDTO::fromRequest($request),
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
    public function update(AttributeValueRequest $request, int $id): JsonResponse
    {
        try {
            $this->service->update(
                AttributeValueDTO::fromRequest($request),
                $id,
            );

            return $this->apiResponse->updated();
        } catch (Throwable $e) {
            if (! $e instanceof HttpException) {
                Log::error($e->getMessage());
                return $this->apiResponse->error($e->getMessage(), code: ResponseCode::ErrorInternal);
            }

            return match ($e->getStatusCode()) {
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
                404 => $this->apiResponse->notFound($e->getMessage()),
                default => $this->apiResponse->error(
                    $e->getMessage(),
                    code: ResponseCode::tryFrom($e->getStatusCode()) ?: ResponseCode::ErrorInternal,
                ),
            };
        }
    }
}
