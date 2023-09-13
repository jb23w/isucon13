import { Typography } from '@mui/joy';
import AspectRatio from '@mui/joy/AspectRatio';
import Avatar from '@mui/joy/Avatar';
import Stack from '@mui/joy/Stack';
import React from 'react';
import { Link } from 'react-router-dom';

export function VideoThumbnail(): React.ReactElement {
  return (
    <Link to="/watch" style={{ textDecoration: 'none' }}>
      <AspectRatio sx={{ borderRadius: 10 }}>
        <img
          src="https://images.unsplash.com/photo-1527549993586-dff825b37782?auto=format&fit=crop&w=400"
          loading="lazy"
        />
      </AspectRatio>
      <Stack direction="row" spacing={1} sx={{ marginTop: 1 }}>
        <Avatar />
        <div>
          <Typography level="title-sm">ビデオタイトル</Typography>
          <Typography level="body-sm">
            <Stack direction="row" spacing={2}>
              <span>チャンネル名</span>
              <span>1234人視聴・12分前</span>
            </Stack>
          </Typography>
        </div>
      </Stack>
    </Link>
  );
}
