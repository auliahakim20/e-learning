<?php

use kartik\select2\Select2;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Course */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="course-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'about')->textarea(['rows' => 6]) ?>

    <!-- <?= $form->field($model, 'institution_id')->textInput() ?> -->
    <?= $form->field($model, 'institution_id')->widget(Select2::className(), [
        'data' => $list_institution,
        'options' => ['placeholder' => 'Change'],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]) ?>

    

    <!-- <?= $form->field($model, 'level_id')->textInput() ?> -->
    <?= $form->field($model, 'level_id')->widget(Select2::className(), [
        'data' => $list_level,
        'options' => ['placeholder' => 'Change'],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]) ?>

    <!-- <?= $form->field($model, 'instructor_id')->textInput() ?> -->
    <?= $form->field($model, 'instructor_id')->widget(Select2::className(), [
        'data' => $list_instructor,
        'options' => ['placeholder' => 'Change'],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]) ?>


    <!-- <?= $form->field($model, 'created_at')->textInput() ?> -->

    <!-- <?= $form->field($model, 'updated_at')->textInput() ?> -->

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
