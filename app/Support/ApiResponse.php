<?php

namespace App\Support;

use App\Enums\ResponseCode;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\ValidationException;

final class ApiResponse
{
    public static function make(): static
    {
        return new static();
    }

    /**
     * Return a success response.
     */
    public function success(mixed $data = null, string $message = 'Success', ResponseCode $code = ResponseCode::Ok): JsonResponse
    {
        return response()->json([
            'success' => true,
            'message' => $message,
            'data' => $data,
        ], $code->value);
    }

    /**
     * Return a created response.
     */
    // public function created(mixed $data = null): JsonResponse
    // {
    //     return $this->success(
    //         data: $data,
    //         message: 'Created successfully',
    //         code: ResponseCode::Created,
    //     );
    // }

    /**
     * Return a updated response.
     */
    // public function updated(mixed $data = null): JsonResponse
    // {
    //     return $this->success(
    //         data: $data,
    //         message: 'Updated successfully',
    //     );
    // }

    /**
     * Return a deleted response.
     */
    // public function deleted(mixed $data = null): JsonResponse
    // {
    //     return $this->success(
    //         data: $data,
    //         message: 'Deleted successfully',
    //     );
    // }

    /**
     * Return an error response.
     */
    public function error(string $message = 'Error', mixed $errors = null, ResponseCode $code = ResponseCode::ErrorBadRequest): JsonResponse
    {
        return response()->json([
            'success' => false,
            'message' => $message,
            'errors' => $errors,
        ], $code->value);
    }

    /**
     * Return a validation error response.
     */
    public function validationError(ValidationException $e, string $message = 'Validation failed'): JsonResponse
    {
        return $this->error(
            message: $message,
            errors: $e->errors(),
            code: ResponseCode::ErrorValidation,
        );
    }

    /**
     * Return a not found response.
     */
    // public function notFound(string $message = 'Resource not found', mixed $errors = null): JsonResponse
    // {
    //     return $this->error(
    //         message: $message,
    //         errors: $errors,
    //         code: ResponseCode::ErrorNotFound,
    //     );
    // }

    /**
     * Return an unauthenticated response.
     */
    public function unauthenticated(mixed $errors = null): JsonResponse
    {
        return $this->error(
            message: 'Unauthenticated',
            errors: $errors,
            code: ResponseCode::ErrorUnauthenticated,
        );
    }

    /**
     * Return a forbidden response.
     */
    // public function forbidden(string $message = 'Forbidden', mixed $errors = null): JsonResponse
    // {
    //     return $this->error(
    //         message: $message,
    //         errors: $errors,
    //         code: ResponseCode::ErrorForbidden,
    //     );
    // }

    /**
     * Return a failed update.
     */
    // public function failedUpdate(): JsonResponse
    // {
    //     return $this->error('Failed to update');
    // }

    /**
     * Return a failed delete.
     */
    // public function failedDelete(): JsonResponse
    // {
    //     return $this->error('Failed to delete');
    // }
}
