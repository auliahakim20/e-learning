<?php

namespace app\models;

use Yii;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "course".
 *
 * @property int $id
 * @property string $title
 * @property string $about
 * @property int $institution_id
 * @property int $subject_id
 * @property int $level_id
 * @property int $instructor_id
 * @property int $created_at
 * @property int $updated_at
 *
 * @property Institution $institution
 * @property Level $level
 * @property Subject $subject
 * @property User $instructor
 * @property CourseLecture[] $courseLectures
 * @property EnroledCourse[] $enroledCourses
 */
class Course extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'course';
    }

    public function behaviors()
    {
       return [
            'blameable' => [
                'class' => BlameableBehavior::className(),
                'createdByAttribute' => 'created_by',
                'updatedByAttribute' => 'updated_by',
            ],
            'timestamp' => [
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_at'],
                ],
            ],
            // 'sluggable' => [
            //     'class' => SluggableBehavior::className(),
            //     'attribute' => 'name',
            //     'slugAttribute' => 'slug',
            // ],    
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            // , 'instructor_id'
            [['about'], 'string'],
            [['institution_id', 'subject_id', 'level_id', 'created_at', 'updated_at'], 'integer'],
            [['title'], 'string', 'max' => 255],
            [['institution_id'], 'exist', 'skipOnError' => true, 'targetClass' => Institution::className(), 'targetAttribute' => ['institution_id' => 'id']],
            [['level_id'], 'exist', 'skipOnError' => true, 'targetClass' => Level::className(), 'targetAttribute' => ['level_id' => 'id']],
            [['subject_id'], 'exist', 'skipOnError' => true, 'targetClass' => Subject::className(), 'targetAttribute' => ['subject_id' => 'id']],
            // [['instructor_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['instructor_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'about' => Yii::t('app', 'About'),
            'institution_id' => Yii::t('app', 'Institution'),
            'subject_id' => Yii::t('app', 'Subject'),
            'level_id' => Yii::t('app', 'Level'),
            // 'instructor_id' => Yii::t('app', 'Instructor'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
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
    public function getLevel()
    {
        return $this->hasOne(Level::className(), ['id' => 'level_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubject()
    {
        return $this->hasOne(Subject::className(), ['id' => 'subject_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    // public function getInstructor()
    // {
    //     return $this->hasOne(User::className(), ['id' => 'instructor_id']);
    // }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCourseLectures()
    {
        return $this->hasMany(CourseLecture::className(), ['course_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEnroledCourses()
    {
        return $this->hasMany(EnroledCourse::className(), ['course_id' => 'id']);
    }
}
