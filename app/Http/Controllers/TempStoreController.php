<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TempStoreController extends Controller
{
    public function tempStore(Request $request)
    {
        if ($request->file('file')) {
            $files = $request->file('file');
            if (!is_array($files)) {
                $files = [$files];
            }

            //loop throu the array
            $images = [];
            for ($i = 0; $i < count($files); $i++) {
                $file = $files[$i];
                $filename = $file->getClientOriginalName();
                $filename = str_replace(' ', '', $filename);
                $images[] = $file->storeAs('temp', $filename);
            }
            return response()->json(['status' => 'success', 'message' => 'file uploaded', 'images' => $images], 200);
        } else {
            return response()->json(['message' => 'error uploading file'], 503);
        }
    }
}
