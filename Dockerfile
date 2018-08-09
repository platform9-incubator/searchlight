FROM 514845858982.dkr.ecr.us-west-1.amazonaws.com/base-images:pmo_base_image_centos_7
MAINTAINER rparikh@platform9.com
LABEL com.platform9.image-type=du

COPY etc/ /etc/searchlight/
RUN mkdir -p /opt/searchlight
RUN mkdir -p /var/run/uwsgi
WORKDIR /opt/searchlight
COPY ./ /opt/searchlight/
RUN pip install --upgrade pip
RUN PBR_VERSION=v1.0.0 pip --no-cache-dir install \
                -chttps://git.openstack.org/cgit/openstack/requirements/plain/upper-constraints.txt?h=stable/pike \
                setuptools==33.1.1 \
                uwsgi \
                python-openstackclient \
                -e .
CMD ["/opt/searchlight/configure-run-searchlight"]
