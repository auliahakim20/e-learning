<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\QuizCategory */

$this->title = Yii::t('app', 'Create Quiz Category');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Quiz Categories'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="quiz-category-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
