<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\CourseSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Courses');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="course-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Course'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'id',
            // 'title',
            [
                'label'=>'Title',
                'attribute'=>'title',
                'format'=> 'raw',
                'value' => function($model){
                    return Html::a($model->title,['course/view-member','id'=>$model->id]);

                }
            ],
            'about:ntext',
            // 'institution.name',
            [
                'label' => 'Institution',
                'attribute' => 'institution_id',
                'value' => 'institution.name',
            ],
            // 'subject.name',
            [
                'label' => 'Subject',
                'attribute' => 'subject_id',
                'value' => 'subject.name',
            ],
            // 'level.name',
            [
                'label' => 'Level',
                'attribute' => 'level_id',
                'value' => 'level.name',
            ],
            // 'instructor_id',
            'created_at:datetime',
            //'updated_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

    <?php Pjax::end(); ?>

</div>
