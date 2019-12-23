<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

$this->title = 'Welcome - Adaptive E-Learning System';
?>
<div class="site-index">

    <div style="margin-bottom: 20px; margin-top: -15px;">
        
        <p>Accelerate your future. Learn anytime, anywhere.</p>

    </div>

    <div class="row">

        <div class="col-lg-3 col-xs-6">
	        <div class="info-box bg-red">
	            <span class="info-box-icon"><i class="fa fa-users"></i></span>

	            <div class="info-box-content">
	            	<span class="info-box-text">Student</span>
	            	<span class="info-box-number"><?= $userModel['studentTotal'] ?></span>

		            <div class="progress">
		                <div class="progress-bar" style="width: 100%"></div>
		            </div>
	              	<span class="progress-description">
	                    I want you to learn together
	            	</span>
	            </div>
	            <!-- /.info-box-content -->
	        </div>
        </div>

        <div class="col-lg-3 col-xs-6">
	        <div class="info-box bg-yellow">
	            <span class="info-box-icon"><i class="fa fa-graduation-cap"></i></span>

	            <div class="info-box-content">
	            	<span class="info-box-text">Lecturer</span>
	            	<span class="info-box-number"><?= $userModel['lecturerTotal'] ?></span>

		            <div class="progress">
		                <div class="progress-bar" style="width: 100%"></div>
		            </div>
	              	<span class="progress-description">
	                    Lecturer will teach you
	            	</span>
	            </div>
	            <!-- /.info-box-content -->
	        </div>
        </div>

        <div class="col-lg-3 col-xs-6">
	        <div class="info-box bg-green">
	            <span class="info-box-icon"><i class="fa fa-book"></i></span>

	            <div class="info-box-content">
	            	<span class="info-box-text">Course</span>
	            	<span class="info-box-number"><?= $courseModel['courseTotal'] ?></span>

		            <div class="progress">
		                <div class="progress-bar" style="width: 100%"></div>
		            </div>
	              	<span class="progress-description">
	                    Course to learn
	            	</span>
	            </div>
	            <!-- /.info-box-content -->
	        </div>
        </div>
        
        <div class="col-lg-3 col-xs-6">
	        <div class="info-box bg-aqua">
	            <span class="info-box-icon"><i class="fa fa-institution"></i></span>

	            <div class="info-box-content">
	            	<span class="info-box-text">Institution</span>
	            	<span class="info-box-number"><?= $institutionModel['institutionTotal'] ?></span>

		            <div class="progress">
		                <div class="progress-bar" style="width: 100%"></div>
		            </div>
	              	<span class="progress-description">
	                    Join on Institution
	            	</span>
	            </div>
	            <!-- /.info-box-content -->
	        </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="box box-success box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">Course</h3>
                </div>
                <div class="box-body">
                    
                	<?php Pjax::begin(); ?>

				    <?= GridView::widget([
				        'dataProvider' => $courseModel['dataCourseProvider'],
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
    <div class="row">
    	<div class="col-md-6">
            <div class="box box-info box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">Institution</h3>
                </div>
                <div class="box-body">
                    
                	<?php Pjax::begin(); ?>

				    <?= GridView::widget([
				        'dataProvider' => $institutionModel['dataInstitutionProvider'],
				        'columns' => [
				            ['class' => 'yii\grid\SerialColumn'],
				            'name',
				            'description:ntext',
				        ],
				    ]); ?>

				    <?php Pjax::end(); ?>

                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="box box-info box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">Subject</h3>
                </div>
                <div class="box-body">
                    
                	<?php Pjax::begin(); ?>

				    <?= GridView::widget([
				        'dataProvider' => $subjectModel['dataSubjectProvider'],
				        'columns' => [
				            ['class' => 'yii\grid\SerialColumn'],
				            'name',
				        ],
				    ]); ?>

				    <?php Pjax::end(); ?>

                </div>
            </div>
        </div>
    </div>

</div>
