# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="WeiXin Robot for sinatra"
HOMEPAGE="https://github.com/kennx/weixin_robot"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


