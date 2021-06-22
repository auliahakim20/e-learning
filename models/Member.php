<?php

namespace app\models;

use yii\db\ActiveRecord;

class Member extends ActiveRecord
{
    public static function tableName()
    {
        return 'member';
    }
    public function rules()
    {
        return [
            [['name', 'course', 'pertemuan', 'keterangan'], 'required'],
            [['name'], 'string'],
            [['name'], 'string'],
            [['pertemuan'], 'string'],
            [['keterangan'], 'string'],
        ];
    }
}
