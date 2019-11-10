<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "institution_instructor".
 *
 * @property int $id
 * @property int $institution_id
 * @property int $user_id
 * @property int $created_at
 * @property int $updated_at
 *
 * @property Institution $institution
 * @property User $user
 */
class InstitutionInstructor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'institution_instructor';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['institution_id', 'user_id', 'created_at', 'updated_at'], 'integer'],
            [['institution_id'], 'exist', 'skipOnError' => true, 'targetClass' => Institution::className(), 'targetAttribute' => ['institution_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'institution_id' => 'Institution ID',
            'user_id' => 'User ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInstitution()
    {
        return $this->hasOne(Institution::className(), ['id' => 'institution_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
