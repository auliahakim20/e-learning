<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

$this->title = 'Welcome - Adaptive E-Learning System';
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>Adaptive E-Learning System</h1>

        <p class="lead">Accelerate your future. Learn anytime, anywhere.</p>

        <!-- <p><a class="btn btn-lg btn-success" href="http://www.yiiframework.com">Get started with Yii</a></p> -->
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title">Course</h3>
                </div>
                <div class="box-body">
                    
                	<?php Pjax::begin(); ?>

				    <?= GridView::widget([
				        'dataProvider' => $dataProvider,
				        'filterModel' => $searchModel,
				        'columns' => [
				            ['class' => 'yii\grid\SerialColumn'],
				            [
				                'label'=>'Title',
				                'attribute'=>'title',
				                'format'=> 'raw',
				                'value' => function($model){
				                    return Html::a($model->title,['view-detail-course','id'=>$model->id]);

				                }
				            ],
				            'about:ntext',
				            [
				                'label' => 'Institution',
				                'attribute' => 'institution_id',
				                'value' => 'institution.name',
				            ],
				            [
				                'label' => 'Subject',
				                'attribute' => 'subject_id',
				                'value' => 'subject.name',
				            ],
				            [
				                'label' => 'Level',
				                'attribute' => 'level_id',
				                'value' => 'level.name',
				            ],
				        ],
				    ]); ?>

				    <?php Pjax::end(); ?>

                </div>
            </div>
        </div>
    </div>

</div>
