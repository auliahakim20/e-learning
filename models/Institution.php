<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "institution".
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 * @property string $description
 * @property int $created_at
 * @property int $updated_at
 *
 * @property Course[] $courses
 * @property InstitutionInstructor[] $institutionInstructors
 */
class Institution extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'institution';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['description'], 'string'],
            [['created_at', 'updated_at'], 'integer'],
            [['name', 'slug'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'slug' => 'Slug',
            'description' => 'Description',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCourses()
    {
        return $this->hasMany(Course::className(), ['institution_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInstitutionInstructors()
    {
        return $this->hasMany(InstitutionInstructor::className(), ['institution_id' => 'id']);
    }
}
