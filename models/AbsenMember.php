<?php

namespace app\models;

use yii\db\ActiveRecord;

class AbsenMember extends ActiveRecord
{
    public static function tableName()
    {
        return 'absenmember';
    }
    public function rules()
    {
        return [
            [['name', 'course', 'pertemuan', 'status'], 'required'],
            [['name'], 'string'],
            [['course'], 'string'],
            [['pertemuan'], 'string'],
            [['status'], 'string'],
        ];
    }
}
