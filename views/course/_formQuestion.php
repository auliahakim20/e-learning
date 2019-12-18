<?php

use kartik\widgets\Select2;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\InstitutionInstructor */
/* @var $form yii\widgets\ActiveForm */
$this->title = 'Add Question';
?>


<div class="lecture-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput() ?>

    <?= $form->field($model, 'answer')->textInput() ?>

    <?= $form->field($model, 'answer2')->textInput() ?>

    <?= $form->field($model, 'answer3')->textInput() ?>

    <?= $form->field($model, 'answer4')->textInput() ?>

    <?= $form->field($model, 'answer5')->textInput() ?>

    <?= $form->field($model, 'answer6')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
