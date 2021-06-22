<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
?>
<h1>Tabel Absensi Member</h1>
<br>
<hr>
<?php
echo "<table class='table table-bordered table-striped'>";
echo "<tr>";
echo "<th>NAME</th>";
echo "<th>COURSE</th>";
echo "<th>PERTEMUAN</th>";
echo "<th>KETERANGAN</th>";
echo "<th>WAKTU</th>";
echo "<th>ACTION</th>";
echo "</tr>";
foreach ($members as $member) {
    echo "<tr>";
    echo "<td>" . $member->name . "</td>";
    echo "<td>" . $member->course . "</td>";
    echo "<td>" . $member->pertemuan . "</td>";
    echo "<td>" . $member->keterangan . "</td>";
    echo "<td>" . $member->tanggal . "</td>";
    echo "<td>";
    echo Html::a(
        '<i class="glyphicon glyphicon-trash"></i>',
        ['member/delete', 'id' => $member->id],
        ['onclick' => 'return (confirm("Apakah data mau dihapus?")?true:false);']
    );
    echo "</td>";
    echo "</tr>";
}
echo "</table>";
// display pagination
echo \yii\widgets\LinkPager::widget([
    'pagination' => $pagination,
]);
