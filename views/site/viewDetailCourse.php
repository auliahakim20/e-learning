<?php

use yii\grid\GridView;
use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Course */
/* @var $form ActiveForm */

$this->title = 'Welcome - Adaptive E-Learning System';

?>
<div class="site-viewDetailCourse">

    <div class="row">
        <div class="col-md-12">
            <div class="box box-success">
                <div class="box-header with-border">
                    <?= Html::a('<span class="fa fa-arrow-circle-left fa-2x"></span>', ['/'], ['class' => '', 'style' => 'float: left; margin-right: 10px;']) ?>
                    <h3 style="padding: 5px;" class="box-title"><?= Html::encode($model->title) ?></h3>
                </div>
                <div class="box-body">
                    <?= DetailView::widget([
                        'model' => $model,
                        'attributes' => [
                            'title',
                            'about:ntext',
                            [
                                'label' => 'Institution',
                                'value' => $model->institution->name,
                            ],
                            [
                                'label' => 'Subject',
                                'value' => $model->subject->name,
                            ],
                            [
                                'label' => 'Level',
                                'value' => $model->level->name,
                            ]
                        ],
                    ]) ?>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Material</h3>
                </div>
                <div class="box-body">
                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
                        'columns' => [
                            [
                                'class' => 'yii\grid\SerialColumn'
                            ],
                            'title',
                            'description',
                        ],
                    ]); ?>
                </div>
            </div>
        </div>
    </div>

</div><!-- site-viewDetailCourse -->
