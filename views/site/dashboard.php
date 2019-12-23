<?php

use yii\helpers\BaseJson;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\helpers\Html;

$directoryAsset = Yii::$app->assetManager->getPublishedUrl('@vendor/almasaeed2010/adminlte/bower_components/chart.js');

$this->registerJs(
    "
        var pieChartCanvas = $('#userChart').get(0).getContext('2d')
        var pieChart       = new Chart(pieChartCanvas)
        var PieData        = ". BaseJson::encode($userChart)."
        var pieOptions     = {
          segmentShowStroke    : true,
          segmentStrokeColor   : '#fff',
          segmentStrokeWidth   : 2,
          percentageInnerCutout: 50,
          animationSteps       : 100,
          animationEasing      : 'easeOutBounce',
          animateRotate        : true,
          animateScale         : false,
          responsive           : true,
          maintainAspectRatio  : true,
        }

        pieChart.Doughnut(PieData, pieOptions)
    "
);

/* @var $this yii\web\View */

$this->title = 'Dashboard - Adaptive E-Learning System';
?>
<div class="site-index">

    <div class="body-content">

        <div class="row">

            <div class="col-lg-4 col-xs-6">
                <div class="info-box bg-red">
                    <span class="info-box-icon"><i class="fa fa-users"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Student</span>
                        <span class="info-box-number"><?= $studentTotal ?></span>

                        <div class="progress">
                            <div class="progress-bar" style="width: 100%"></div>
                        </div>
                        <span class="progress-description">
                            Total Student
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>

            <div class="col-lg-4 col-xs-6">
                <div class="info-box bg-yellow">
                    <span class="info-box-icon"><i class="fa fa-graduation-cap"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Lecturer</span>
                        <span class="info-box-number"><?= $lecturerTotal ?></span>

                        <div class="progress">
                            <div class="progress-bar" style="width: 100%"></div>
                        </div>
                        <span class="progress-description">
                            Total Lecturer
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>

            <div class="col-lg-4 col-xs-6">
                <div class="info-box bg-aqua">
                    <span class="info-box-icon"><i class="fa fa-institution"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Institution</span>
                        <span class="info-box-number"><?= $institutionTotal ?></span>

                        <div class="progress">
                            <div class="progress-bar" style="width: 100%"></div>
                        </div>
                        <span class="progress-description">
                            Total Institution User
                        </span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
            </div>

            </div>
        </div>

        <div class="row">
            <div class="col-md-5">

                <div class="box box-warning box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">User Registered</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                        </div>
                    </div>
                    <div class="box-body">
                        <canvas id="userChart" style="height:250px"></canvas>
                    </div>
                </div>

            </div>

            <div class="col-md-7">

                <div class="box box-success box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">Enroled Course History</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                        </div>
                    </div>
                    <div class="box-body">

                        <?php Pjax::begin(); ?>

                        <?= GridView::widget([
                            'dataProvider' => $dataEnroledCourseProvider,
                            'columns' => [
                                ['class' => 'yii\grid\SerialColumn'],
                                [
                                    'label' => 'User',
                                    'attribute' => 'user_id',
                                    'value' => 'user.username',
                                ],
                                [
                                    'label' => 'Course',
                                    'attribute' => 'course_id',
                                    'value' => 'course.name',
                                ],
                                'created_at:datetime'
                            ],
                        ]); ?>

                        <?php Pjax::end(); ?>

                    </div>
                </div>

            </div>

        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="box box-success box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">Course</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                        </div>
                    </div>
                    <div class="box-body">
                        
                        <?php Pjax::begin(); ?>

                        <?= GridView::widget([
                            'dataProvider' => $dataCourseProvider,
                            'columns' => [
                                ['class' => 'yii\grid\SerialColumn'],
                                [
                                    'label'=>'Title',
                                    'attribute'=>'title',
                                    'format'=> 'raw',
                                    'value' => function($model){
                                        return Html::a($model->title,['course/view-member','id'=>$model->id]);
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
</div>

<script type="text/javascript" src="<?= $directoryAsset ?>/Chart.js"></script>
