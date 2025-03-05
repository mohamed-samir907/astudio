<?php

namespace App\Enums;

enum ResponseCode: int
{
    case Ok = 200;
    case Created = 201;
    case ErrorValidation = 422;
    case ErrorInternal = 500;
    case ErrorBadRequest = 400;
    case ErrorNotFound = 404;
    case ErrorUnauthenticated = 401;
    case ErrorForbidden = 403;
}
